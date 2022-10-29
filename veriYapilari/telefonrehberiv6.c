#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct dugum
{
    char isim[40];
    char soyisim[40];
    char telefon[10];
    char mail[40];
    struct dugum * sonra;

};
typedef struct dugum rehber;

rehber *ac = NULL;
rehber *kisiEkle(char [40], char [40], char [10], char [40]);
rehber *kisi1 = NULL;

void listele(rehber *);
void ismeGoreAra(rehber *, char [40]);
void soyismeGoreAra(rehber *, char [40]);
void sil();

int main()
{
    int secim;
    printf("______Telefon Rehberi______ ");
    while (secim != 5)
    {
        printf("\n \n 1 - Rehberi Goruntule \n 2 - Kisileri Isinlerine Gore Ara \n 3 - Kisileri Soyisimlerine gore ara \n 4 - Kisileri Sil \n 5 - Programi Kapat\n Secim : ");
        scanf("%d", &secim);

        switch (secim)
        {
            case 1:
                /* Rehberi ekranda gorunteleyecek blok */
                kisi1 = kisiEkle(strcpy(kisi1->isim,"Muhammet Abdullah"), strcpy(kisi1->soyisim,"Sahin"), strcpy(kisi1->telefon,"5351040690"), strcpy(kisi1->mail,"apo690apo@gmail.com"));
                rehber *kisi2 = kisiEkle(strcpy(kisi2->isim,"Salih"), strcpy(kisi2->soyisim,"Sahin"), strcpy(kisi2->telefon,"5352637898"), strcpy(kisi2->mail,"salihsahin@gmail.com"));
                rehber *kisi3 = kisiEkle(strcpy(kisi3->isim,"Ahmet"), strcpy(kisi3->soyisim,"Kilic"), strcpy(kisi3->telefon,"5436678790"), strcpy(kisi3->mail,"ahmetkilic@gmail.com"));
                rehber *kisi4 = kisiEkle(strcpy(kisi4->isim,"Muhammet"), strcpy(kisi4->soyisim,"Tamur"), strcpy(kisi4->telefon,"5321447690"), strcpy(kisi4->mail,"m.tamur@gmail.com"));

                kisi1 -> sonra = kisi2;
                kisi2 -> sonra = kisi3;
                kisi3 -> sonra = kisi4;
                kisi4 -> sonra = kisi1;

                listele(kisi1);
                break;
            case 2:
                /* Kisileri isimlerine gore bulacak blok */
                char a[40];

                printf("aranacak kisinin adi: ");
                scanf("%s", &a[40]);

                ismeGoreAra(kisi1, a);
                break;
            case 3:
                /* Kisileri soyisimlerine gore bulacak blok */
                char b[40];

                printf("aranacak kisinin soyadi: ");
                scanf("%s", &b[40]);

                soyismeGoreAra(kisi1, b);
                break;   
            case 4:
                /* Kisileri silecek blok */
                sil();

                break;                              
            case 5:
                /*Programi kaptan block*/
                exit;

                break;
            default:
                system("cls");
                printf("Lutfen Gecerli Bir Islem Girin!");
                break;
        }
    }
    return 0;
}

rehber *kisiEkle(char isim[40], char soyisim[40], char telefon[10], char mail[40])
{
    rehber *kisi = (rehber *)malloc(sizeof(rehber));

    kisi -> isim[40] = isim[40];
    kisi -> soyisim[40] = soyisim[40];
    kisi -> telefon[10] = telefon[10];
    kisi -> mail[40] = mail[40];

    kisi -> sonra = NULL;

    return kisi;
}

void listele(rehber *dayanak)
{
    rehber* gecici = dayanak;

    while (dayanak != NULL)
    {
        printf("\n ad: %s\n soyad: %s\n telefon numarasi: %s\n mail adresi %s\n",gecici -> isim, gecici -> soyisim, gecici -> telefon, gecici -> mail);

        gecici = gecici -> sonra;
    }

    printf("\n ad: %s\n soyad: %s\n telefon numarasi: %s\n mail adresi %s\n",gecici -> isim, gecici -> soyisim, gecici -> telefon, gecici -> mail);
}

void ismeGoreAra(rehber *baslangic, char aranan[40])
{
	rehber *gecici = baslangic;

	while(gecici != NULL)
    {
		if(gecici -> isim[40] == aranan[40])
        {
			printf("\n ad: %s\n soyad: %s\n telefon numarasi: %s\n mail adresi %s\n",gecici -> isim[40], gecici -> soyisim[40], gecici -> telefon[10], gecici -> mail[40]); 

			return;
		}

		gecici = gecici -> sonra;
	}

	printf("aranan %s listede bulunamadi\n");
}

void soyismeGoreAra(rehber *baslangic, char aranan[40])
{
	rehber *gecici = baslangic;

	while(gecici != NULL)
    {
		if(gecici -> isim[40] == aranan[40])
        {
			printf("\n ad: %s\n soyad: %s\n telefon numarasi: %s\n mail adresi %s\n",gecici -> isim[40], gecici -> soyisim[40], gecici -> telefon[10], gecici -> mail[40]); 

			return;
		}

		gecici = gecici -> sonra;
	}

	printf("aranan %s listede bulunamadi\n");
}

void sil()
{
	if(ac == NULL)
    {
		printf("Bos liste!");
	}
	else
    {
		ac = NULL;

		printf("Listede eleman kalmadi");
	}
    free(ac);
}