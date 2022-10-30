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
rehber *kisi1 = NULL;

int main(int argc, char const *argv[])
{
    rehber *gecici = NULL;
    kisi1 = kisiEkle("abdullah", "sahin","5351040690","apo690apo@gmail.com");
    rehber *kisi2 = kisiEkle("salih","Sah","5352637898","salihsahin@gmail.com");
    rehber *kisi3 = kisiEkle("ahmet","kilic", "5436678790","ahmetkilic@gmail.com");
    rehber *kisi4 = kisiEkle("muhammet","tamur","5321447690","m tamur@gmail.com");
    kisi1 -> sonra = kisi2;
    kisi2 -> sonra = kisi3;
    kisi3 -> sonra = kisi4;
    gecici = kisi1;

    do
    {
        printf ("----------------------------------------------------------------------------------------------------\n");
        printf(" |Isim: %s| ", gecici->isim);
        printf(" |soyisim: %s| ", gecici->soyisim);
        printf(" |numara: %d| ", gecici->numara);
        printf(" |eposta: %s| \n", gecici->eposta);
        printf ("----------------------------------------------------------------------------------------------------\n");

        gecici = gecici -> sonra;
    } while (gecici != NULL);
    

    
    return 0;
}
