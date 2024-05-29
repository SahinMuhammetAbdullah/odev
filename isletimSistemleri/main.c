/* Evrelerle gerçekleştirilen iki matrisin çarpımı  */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>  /* uintptr_t için */
#include <pthread.h> /* pthread_* işlevleri için */


/*
 * Test amaçlı olarak kullanacağımız matrislerin boyu.
 * 5x5 boyutlu matrisler
 */
#define MATRIX_LENGTH 5
/*
 * Tamsayılar hangi aralıkta olsun?
 */
#define RANDOM_RANGE 10

/*
 * Kaç evre (thread) kullanılsın?
 */
#define NTHREAD 4

/*
 * Test matrisleri.
 */

static int matrix_a[MATRIX_LENGTH][MATRIX_LENGTH];
static int matrix_b[MATRIX_LENGTH][MATRIX_LENGTH];


/*
 *  Matris elemanları arasında
 *  gezinen yardımcı elemanlar.
 */
int i,j,k;

/*
 * Sonuç.
 */
static int matrix_sonuc[MATRIX_LENGTH][MATRIX_LENGTH];

/*
 * Tüm evreler arasında paylaşılan karşılıklı dışlayıcı.
 */
static pthread_mutex_t mutex_matrix_product;

/* Test vektörlerini ilkle. */
static void init(void) 
{ 
  	
	long i;
        /*
         * MATRIX_LENGTH uzunluğunda iki matris oluştur ve
         * test amaçlı olarak [0, RANDOM_RANGE] aralığında
         * rastgele tamsayı değerleriyle doldur.
         */
     

         for(i=0; i<MATRIX_LENGTH; i++)
			 for(j=0; j<MATRIX_LENGTH; j++)
				 matrix_a[i][j] = matrix_b[i][j] = rand() % RANDOM_RANGE;
}

/* İçi doldurulan test matrislerinin çarpımını hesapla */
static void *process(void *arg)
{
        /*
         * Evre oluşturulurken ilgili evre sırası bir void işaretçide
         * taşınarak bu işleve iletiliyor.
         */

        long i;
        long sum;

  
        /*
         * İşlemi yap.  Burada her evre kendi vektör aralığında bağımsız
         * şekilde çalışıyor.  Örnek olarak basit bir işlem yapıyoruz:
         * elemanları çarp, topla ve ilgili aralığa düşür.  Bir tür
         * "matris çarpımı".
         */
         for(i=0; i<MATRIX_LENGTH; i++){
       		for(j=0; j<MATRIX_LENGTH; j++){
			for(sum=0, k=0; k<MATRIX_LENGTH; k++)
             			sum += matrix_a[i][k] * matrix_b[k][j];
				
				/*
				 * Sonuc matrisinin içini hesaplanan değerlerle doldururken
				 * bir kilit => mutex koyuyoruz. Böylece yazma işleminin
				 * korumalı yapılmasını sağlayarak aynı anda başka bir
				 * threadin yazma yapmasının önüne geçmiş oluyoruz. 
				 */
				pthread_mutex_lock(&mutex_matrix_product);
        			matrix_sonuc[i][j] = sum;
        			pthread_mutex_unlock(&mutex_matrix_product);

       		}
    	}
        /*
         * Bu evre bir sonuç üretti ("nokta çarpımı").  Bu sonucu toplam
         * sonuca ekleyeceğiz.  Fakat aynı anda bir başka evre de bu
         * işlemi yapıyor olabilir.  Dolayısıyla sonuç değişkenine
         * yazarken diğer evrelerin bu değişkene erişmesini
         * engellemeliyiz.  Nasıl?  Bir "kardış" kullanarak.  Karşılıklı
         * kilitlemeyi mümkün olan en dar aralıkta, yani "kiritk
         * bölge"de yapıyoruz.
         */
        

        /*
         * Evre tamamlandı.  pthread_join bu çağrıyı bekliyor.
         */
        pthread_exit(NULL);
}

/* Sonucu raporla. */
static void report(void)
{
	 for(i=0; i<MATRIX_LENGTH; i++){
       		for(j=0; j<MATRIX_LENGTH; j++){
			
			printf("%4d", matrix_sonuc[i][j]);
       		}
		printf("\n");
    	}
}



int main(void)
{
        /*
         * Daha sonra void işaretçiye dönüştürülecek bir pozitif tamsayı
         * gerekiyor.  int veya uint kullanmamalıyız, taşınabilir değil
         * ve uyarı üretir.  Bunun yerine stdint.h başlığında tanımlı
         * olan özel bir veritipi kullanıyoruz.  Bu basitçe bir pozitif
         * tamsayı, öyle ki sorunsuz şekilde void bir işaretçiye
         * dönüştürülebilir.
         */
        uintptr_t i;

        /*
         * Evre dizisi.
         */
        pthread_t threads[NTHREAD];

        /*
         * Vektörleri oluştur.
         */
        init();

        /*
         * Karşılıklı dışlayıcıyı ("kardış") hazırla.
         *
         * Kardışı bu işlevle ilklendirmek yerine (alternatif bir yöntem
         * olarak) mutex_dot_product değişkeni tanımlandığı yerde
         * ilklendirilebilirdi:
         *
         *      mutex_dot_product = PTHREAD_MUTEX_INITIALIZER;
         */
        
	pthread_mutex_init(&mutex_matrix_product, NULL);

        /*
         * Evreleri oluştur ve ilgili işleve bağla.
         */
        
	for (i = 0; i < NTHREAD; i++)
                /* tip dönüşümüne dikkat */
                pthread_create(&threads[i], NULL, process, (void *) i);

        /*
         * Evrelerin tamamlanmasını bekle.
         *
         * Her evre kendi işlemini yapıyor.  Sonucu almamız için
         * katılımcı tüm evrelerin tamamlanmasını beklemeliyiz.
         * Evreleri görevlendirildikleri işler için bir yere gönderilen
         * ulaklar gibi düşünün.  Bu ulaklar görevleri tamamlandığında
         * bir noktada buluşuyorlar ("join").
         */
        for (i = 0; i < NTHREAD; i++)
                pthread_join(threads[i], NULL);

        /*
         * Sonucu raporla.
         */
        report();

        /*
         * Karşılıklı dışlayıcıyı yoket.
         */
        pthread_mutex_destroy(&mutex_matrix_product);

        exit(EXIT_SUCCESS);
}