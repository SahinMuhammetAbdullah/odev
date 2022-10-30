#include<stdio.h>
#include<string.h>
#include<stdlib.h>

struct kisi
{
    char isim[100];
    char soyisim[100];
    char numara[100];
    char mail[100];
    struct kisi *sonraki;
};

struct kisi *baslangic=NULL;

struct kisi *getnode()
{
    return((struct kisi *)malloc(sizeof(struct kisi)));
} 

void goruntuleme(struct kisi *baslangic)
{
    struct kisi *temp;
    temp=baslangic;
    if(temp == NULL){
        printf("Rehber bos!");
    }
    while(temp!=NULL)
    {
        printf("|| %s ",temp->isim);
        printf("-- %s ",temp->soyisim);
        printf("-- %s ",temp->numara);
        printf("-- %s ||\n",temp->mail);
        temp=temp->sonraki;
    }
}

void ekleme()
{
    struct kisi *temp,*abc;
    abc=getnode();
    temp=baslangic;
    while(temp->sonraki!=NULL)
    {
        temp=temp->sonraki;
        
    }
    printf("Ismi Giriniz: ");
    scanf("%s",&abc->isim);
    printf("Soyismi Giriniz: ");
    scanf("%s",&abc->soyisim);
    printf("Telefon Numarasini Giriniz: ");
    scanf("%s",&abc->numara);
    printf("E_Posta Giriniz: ");
    scanf("%s",&abc->mail);
    temp->sonraki=abc;
    abc->sonraki=NULL;
    goruntuleme(baslangic);
}

struct kisi *olusturma()
{
    struct kisi *temp,*abc;
    if(baslangic!=NULL)
        ekleme();
    else
    {
    abc=getnode();
    baslangic=abc;
    temp=baslangic;
    printf("Ismi Giriniz: ");
    scanf("%s",abc->isim);
    printf("Soyismi Giriniz: ");
    scanf("%s",abc->soyisim);
    printf("Telefon Numarasini Giriniz: ");
    scanf("%s",abc->numara);
    printf("E_Posta Giriniz: ");
    scanf("%s",abc->mail);
    abc -> sonraki = NULL;
    goruntuleme(baslangic);
    }
}

void arama()
{
    struct kisi *temp;
    int v = 0;
    char ad[100],soyad[100];
    temp=baslangic;
    printf("Aradiginiz Ismi Giriniz: ");
    scanf("%s", ad);
    printf("Aradiginiz Soyismi Giriniz: ");
    scanf("%s", soyad);
    while((strcmp(temp->isim, ad) != 0)&&(strcmp(temp->soyisim, soyad) != 0))
    {
        if(temp->sonraki == NULL){
            printf("\nKisi bulunamadi!");
            v = 1;
            break;
        }
        temp=temp->sonraki;
    }
    if(v == 0){
        printf("|| %s ",temp->isim);
        printf("-- %s ",temp->soyisim);
        printf("-- %s ",temp->numara);
        printf("-- %s ||\n",temp->mail);
    }
}

void silme()
{
    struct kisi *ttemp,*temp;
    int v = 0;
    char ad[100], soyad[100];
    temp=baslangic;
    printf("Sileceginiz Ismi Yaziniz: ");
    scanf("%s", ad);
    printf("Sileceginiz Soyismi Yaziniz: ");
    scanf("%s", soyad);
    if((strcmp(temp->isim, ad) == 0) && (strcmp(temp->soyisim, soyad) == 0))
    {
        printf("%s %s silindi.", temp->isim, temp->soyisim);
        temp = baslangic -> sonraki;
        free(baslangic);
        baslangic = temp;
    }
    else if(temp -> sonraki != NULL)
    {
        while((strcmp(temp->sonraki->isim, ad) != 0)&&(strcmp(temp->sonraki->soyisim, soyad) != 0))
        {
            if(temp->sonraki->sonraki == NULL){
                printf("\nSilinecek kisi bulunamadi!");
                v = 1;
                break;
            }
            temp = temp -> sonraki;
        }
        if(v == 0){
            printf("%s %s silindi.\n", temp->sonraki->isim, temp->sonraki->soyisim);
            if(temp->sonraki->sonraki != NULL)
            {
                ttemp = temp -> sonraki -> sonraki;
                free(temp -> sonraki);
                temp -> sonraki = ttemp;
            }
            else
            {
                free(temp -> sonraki);
                temp -> sonraki = NULL;
            }
        }
    }else{
        printf("\nSilinecek kisi bulunamadi!");
    }
    
}


int main()
{
    int cikis,secenek;
    do{
        printf("---------------------------------------------------------------------\n");
        printf("|Rehberimize Hosgeldiniz Rehberde Yapmak Istediginiz Islemi Giriniz:|\n");
        printf("---------------------------------------------------------------------\n");
        printf("1.Kisi Olusturma\n2.Rehberi Goruntule\n3.Kisi Silme\n4.Kisi Arama\n");
        printf("Yapmak Istediginiz Islem: ");
        scanf("%d",&secenek);
        switch(secenek)
        {
            case 1: olusturma();
            break;
            case 2: goruntuleme(baslangic);
            break;
            case 3: silme();
            break;
            case 4: arama();
            break; 
            default:
            printf("Hatali Tuslama Yaptiniz");
            break;
        }
        printf("\nCikmak Istiyor musunuz? 1 - Evet / 0 - Hayir: ");
        scanf("%d",&cikis);
    }while(cikis!=1);
return 0;
}