
import java.util.ArrayList;
import java.util.List;

public class Database {

    private final List<Seat> seats;

    public Database(int numberOfSeats) {
        seats = new ArrayList<>();
        for (int i = 1; i <= numberOfSeats; i++) {
            seats.add(new Seat(i));
        }
    }

    public Seat getSeat(int seatNumber) {
        return seats.get(seatNumber - 1);
    }

    public List<Seat> getSeats() {
        return seats;
    }
}
