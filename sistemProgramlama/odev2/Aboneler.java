import java.util.ArrayList;
import java.util.List;
import java.io.Serializable;

public class Aboneler implements Serializable {
    private static final long serialVersionUID = 1L;

    Aboneler(){
        lastUpdatedEpochMiliSeconds = 0;
        abonelerListesi = new ArrayList<boolean>();
        girisYapanlarListesi = new ArrayList<boolean>();
    }

    public long getEpochMiliSeconds() {
        return lastUpdatedEpochMiliSeconds;
    }

    public void setEpochMiliSeconds(long lastUpdatedEpochMiliSeconds) {
        this.lastUpdatedEpochMiliSeconds = lastUpdatedEpochMiliSeconds;
    }

    long lastUpdatedEpochMiliSeconds;

    public List<boolean> getAboneler() {
        return abonelerListesi;
    }

    public void setAboneler(List<boolean> aboneler) {
        abonelerListesi = aboneler;
    }

    List<boolean> abonelerListesi;

    public List<boolean> getGirisYapanlarListesi() {
        return girisYapanlarListesi;
    }

    public void setGirisYapanlarListesi(List<boolean> girisYapanlarListesi) {
        this.girisYapanlarListesi = girisYapanlarListesi;
    }

    List<boolean> girisYapanlarListesi;
}

