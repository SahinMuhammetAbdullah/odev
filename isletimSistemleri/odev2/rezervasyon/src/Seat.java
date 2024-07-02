
public class Seat {

    private final int seatNumber;
    private boolean isReserved;

    public Seat(int seatNumber) {
        this.seatNumber = seatNumber;
        this.isReserved = false;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public boolean isReserved() {
        return isReserved;
    }

    public boolean reserve() {
        if (!isReserved) {
            try {
                Thread.sleep(10); // Yarış durumunu artırmak için küçük gecikme
            } catch (InterruptedException e) {
                System.out.println("Hata: " + e.getMessage());
            }
            isReserved = true;
            return true;
        }
        return false;
    }

    public void cancelReservation() {
        isReserved = false;
    }
}
