
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ReservationSystem {

    public static void main(String[] args) throws InterruptedException {
        int numberOfSeats = 5;
        Database db = new Database(numberOfSeats);
        Lock lock = new ReentrantLock();
        Condition writeCondition = lock.newCondition();

        // Kilitsiz
        System.out.println("Kilitsiz:");
        Thread t0 = new ReaderWriter(db, 1, lock, writeCondition, false);
        Thread t1 = new ReaderWriter(db, 1, lock, writeCondition, false);
        Thread t2 = new ReaderWriter(db, 2, lock, writeCondition, false);
        Thread t3 = new ReaderWriter(db, 2, lock, writeCondition, false);

        t0.start();
        t1.start();
        t2.start();
        t3.start();

        t0.join();
        t1.join();
        t2.join();
        t3.join();

        // Koltukları sıfırla
        for (Seat seat : db.getSeats()) {
            seat.cancelReservation();
        }

        // Kilitli
        System.out.println("\nKilitli:");
        Thread t4 = new ReaderWriter(db, 1, lock, writeCondition, true);
        Thread t5 = new ReaderWriter(db, 1, lock, writeCondition, true);
        Thread t6 = new ReaderWriter(db, 2, lock, writeCondition, true);
        Thread t7 = new ReaderWriter(db, 2, lock, writeCondition, true);

        t4.start();
        t5.start();
        t6.start();
        t7.start();

        t4.join();
        t5.join();
        t6.join();
        t7.join();
    }
}
