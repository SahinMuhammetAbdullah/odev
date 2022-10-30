#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node
{
    char isim[40];
    char soyisim[40];
    char numara[20];
    char eposta[40];

    struct node *sonra;
}rehber;


rehber *yerAyir();
rehber *olsutur();
rehber *bas = NULL;
void ekle();
void listele(rehber *bas);
void ismeGoreSil();
void ismeGoreAra();

int main()
{
    int cikis, giris;
    
    do{
        printf("-------------hosgeldiniz-------------\n");
        printf("1.Ilk kisiyi olusturun\n2.Ilk kisiyi olusturduktan sonra ekle\n3.Goruntule\n4.Isme gore sil\n5.Isme gore ara\n");
        printf("Secimin nedir:");
        scanf("%d",&giris);
        switch(giris)
        {
            case 1: 
                olsutur();
                break;
            case 2: 
                ekle();
                break;
            case 3: 
                listele(bas);
                break;
            case 4: 
                ismeGoreSil();
                listele(bas);
                break;
            case 5: 
                ismeGoreAra();
            break;
            default:
                printf("Lutfen gecerli bir islem giriniz...");
                break;
        }
        printf("Uygulamadan Cikmak Istemisin (DIKKAT ET REHBERIN SILINE BILIR:))?0 CIK:");
        scanf("%d",&cikis);
    }while(cikis != 0);
    printf("-------------gule gule-------------\n");
    return 0;
}

rehber *yerAyir()
{
    return ((rehber *)malloc(sizeof(rehber)));
}

rehber *olsutur()
{
    rehber *gecici,*nn;

    if(bas != NULL)
        ekle();
    else
    {
    
    nn = yerAyir();
    bas = nn;
    gecici = bas;
    
    printf("Isim giriniz:\n");
    scanf("%s",&nn -> isim);
    printf("Soyisim giriniz:\n");
    scanf("%s",&nn -> soyisim);
    printf("Enter number:\n");
    scanf("%s",&nn -> numara);
    printf("eposta giriniz:\n");
    scanf("%s",&nn -> eposta);

    nn -> sonra = NULL;
    
    listele(bas);
    }
}

void ekle()
{
    rehber *gecici,*nn;
    
    nn = yerAyir();
    gecici = bas;
    
    while(gecici -> sonra != NULL)
    {
        gecici = gecici -> sonra;
        
    }

    printf("Isim giriniz:\n");
    scanf("%s",&nn -> isim);
    printf("Soyisim giriniz:\n");
    scanf("%s",&nn -> soyisim);
    printf("Enter number:\n");
    scanf("%s",&nn -> numara);
    printf("eposta giriniz:\n");
    scanf("%s",&nn -> eposta);
    
    gecici -> sonra = nn;
    
    nn -> sonra = NULL;
    
    listele(bas);
}

void listele(rehber *bas)
{
    rehber *gecici;
    gecici = bas;

    while (gecici != NULL)
    {
        printf ("----------------------------------------------------------------------------------------------------\n");
        printf(" |Isim: %s| ", gecici->isim);
        printf(" |soyisim: %s| ", gecici->soyisim);
        printf(" |numara: %s| ", gecici->numara);
        printf(" |eposta: %s| \n", gecici->eposta);
        printf ("----------------------------------------------------------------------------------------------------\n");

        gecici = gecici -> sonra;
    }
}

void ismeGoreSil()
{
    rehber *gecici1,*gecici;
    int v = 0;
    char ad[100];
    gecici = bas;
    printf("Sileceginiz Ismi Yaziniz: ");
    scanf("%s", ad);

    if(strcmp(gecici->isim, ad) == 0)
    {
        printf("%s silindi.", gecici->isim);
        gecici = bas -> sonra;
        free(bas);
        bas = gecici;
    }
    else if(gecici -> sonra != NULL)
    {
        while(strcmp(gecici -> sonra-> isim, ad) != 0)
        {
            if(gecici -> sonra -> sonra == NULL){
                printf("\nSilinecek kisi bulunamadi!");
                v = 1;
                break;
            }
            gecici = gecici -> sonra;
        }
        if(v == 0){
            printf("%s silindi.\n", gecici -> sonra ->isim);
            if(gecici-> sonra ->sonra != NULL)
            {
                gecici1 = gecici -> sonra -> sonra;
                free(gecici -> sonra);
                gecici -> sonra = gecici1;
            }
            else
            {
                free(gecici -> sonra);
                gecici -> sonra = NULL;
            }
        }
    }else{
        printf("\nSilinecek kisi bulunamadi!");
    }
    
}

void ismeGoreAra()
{
    rehber *gecici;
    int v = 0;
    char ad[100];
    gecici = bas;
    printf("Ismi Giriniz: ");
    scanf("%s", ad);

    while(strcmp(gecici ->isim, ad) != 0)
    {
        if(gecici -> sonra == NULL){
            printf("\nKisi bulunamadi!");
            v = 1;
            break;
        }
        gecici = gecici -> sonra;
    }
    if(v == 0){
        printf ("----------------------------------------------------------------------------------------------------\n");
        printf(" |Isim: %s| ", gecici->isim);
        printf(" |soyisim: %s| ", gecici->soyisim);
        printf(" |numara: %s| ", gecici->numara);
        printf(" |eposta: %s| \n", gecici->eposta);
        printf ("----------------------------------------------------------------------------------------------------\n");
    }
}