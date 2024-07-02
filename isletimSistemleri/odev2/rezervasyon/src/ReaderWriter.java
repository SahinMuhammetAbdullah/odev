
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

public class ReaderWriter extends Thread {

    private final Database db;
    private final int seatNumber;
    private final Lock lock;
    private final Condition writeCondition;
    private final boolean useLock;

    public ReaderWriter(Database db, int seatNumber, Lock lock, Condition writeCondition, boolean useLock) {
        this.db = db;
        this.seatNumber = seatNumber;
        this.lock = lock;
        this.writeCondition = writeCondition;
        this.useLock = useLock;
    }

    private String getCurrentTimestamp() {
        return new SimpleDateFormat("HH:mm:ss.SSS").format(new Date());
    }

    @Override
    public void run() {
        String timestamp = getCurrentTimestamp();
        if (useLock) {
            lock.lock();
        }
        try {
            // Yazma işlemi başlangıcı
            System.out.println("Zaman: " + timestamp);
            System.out.println(Thread.currentThread().getName() + " koltuk " + seatNumber + "'i rezerve etmeye çalışıyor");
            System.out.println();

            // Okuma işlemi
            timestamp = getCurrentTimestamp();
            System.out.println("Zaman: " + timestamp);
            System.out.println(Thread.currentThread().getName() + " uygun koltukları arıyor. Koltukların durumu:");
            StringBuilder status = new StringBuilder();
            for (Seat seat : db.getSeats()) {
                status.append("Koltuk No ").append(seat.getSeatNumber())
                        .append(" : ").append(seat.isReserved() ? 1 : 0).append(" ");
            }
            System.out.println(status.toString().trim());
            System.out.println("------------------------------------------------------------");
            System.out.println();

            if (useLock) {
                writeCondition.signalAll();
            }

            Thread.sleep(50); // Küçük bir gecikme

            // Yazma işlemi
            Seat seat = db.getSeat(seatNumber);
            timestamp = getCurrentTimestamp();
            System.out.println("Zaman: " + timestamp);
            if (seat.reserve()) {
                System.out.println(Thread.currentThread().getName() + " koltuk " + seatNumber + "'i başarıyla rezerve etti.");
            } else {
                System.out.println(Thread.currentThread().getName() + " koltuk " + seatNumber + "'i rezerve edemedi çünkü zaten rezerve edilmiş.");
            }
            System.out.println();

            if (useLock) {
                writeCondition.signalAll();
            }
        } catch (InterruptedException e) {
            System.out.println("Hata: " + e.getMessage());
        } finally {
            if (useLock) {
                lock.unlock();
            }
        }
    }
}
