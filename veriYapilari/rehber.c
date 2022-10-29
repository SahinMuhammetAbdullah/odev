#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node
{
    char isim[40];
    char soyisim[40];
    char numara[10];
    char email[40];

    struct node *adres;
};
typedef struct node rehber;

rehber *kisiOlustur(char [40], char [40], char [10], char [40]);
void listele();
rehber *node1 = NULL;


int main(int argc, char const *argv[])
{
    node1 = kisiOlustur((strcpy(node1->isim,"muhammet")), (strcpy(node1->soyisim,"sahin")), (strcpy(node1->numara,"5351040690")), (strcpy(node1->email,"apo690apo@gmail.com")));
    rehber *node2 = kisiOlustur((strcpy(node2->isim,"abdullah")), (strcpy(node2->soyisim,"sah")), (strcpy(node2->numara,"5354647586")), (strcpy(node2->email,"muhsah@gmail.com")));
    rehber *node3 = kisiOlustur((strcpy(node3->isim,"salih")), (strcpy(node3->soyisim,"katar")), (strcpy(node3->numara,"5453826475")), (strcpy(node3->email,"sahkat@gmail.com")));
    rehber *node4 = kisiOlustur((strcpy(node4->isim,"kamil")), (strcpy(node4->soyisim,"kanar")), (strcpy(node4->numara,"5463760964")), (strcpy(node4->email,"kankam@gmail.com")));

    node1->adres=node2;
    node2->adres=node3;
    node3->adres=node4;

    listele();
    return 0;
}

rehber *kisiOlustur(char isim[40], char soyisim[40], char numara[10], char email[40])
{
    rehber *newnode = (rehber *)malloc(sizeof(rehber));

    newnode -> isim[40] = isim[40];
    newnode -> soyisim[40] = soyisim[40];
    newnode -> numara[10] = numara[10];
    newnode -> email[40] = email[40];

    newnode -> adres = NULL;

    return newnode;
}

void listele()
{
    rehber *gecici = node1;
    while (gecici != NULL)
    {

        printf("\n isim: %s", gecici -> isim[40]);
        printf("\n soyisim: %s", gecici -> soyisim[40]);
        printf("\n numara: %s", gecici -> numara[40]);
        printf("\n email: %s", gecici -> email[40]);
        gecici = gecici -> adres;
    }

    printf("\n isim: %s", gecici -> isim[40]);
    printf("\n soyisim: %s", gecici -> soyisim[40]);
    printf("\n numara: %s", gecici -> numara[40]);
    printf("\n email: %s", gecici -> email[40]);
}

//    printf("\n isim: %s\n soyisim: %s\n telefon numarasi: %s\n mail adresi: %s\n",gecici -> isim, gecici -> soyisim, gecici -> numara, gecici -> email);
/*
printf("\n isim: %s", gecisi -> isim[40]);
printf("\n soyisim: %s", gecisi -> soyisim[40]);
printf("\n numara: %s", gecisi -> numara[40]);
printf("\n email: %s", gecisi -> email[40]);
*/
