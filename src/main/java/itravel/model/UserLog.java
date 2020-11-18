package itravel.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

public class UserLog {
    private User theUser;
    private List<LocalDateTime> loginTime;
    private ZoneId zoneId;
    public UserLog(User theUser) {
        this.theUser = theUser;
        this.loginTime = new ArrayList<>();
        this.zoneId = ZoneId.systemDefault();
    }

    public User getTheUser() {
        return theUser;
    }

    public List<LocalDateTime> getLoginTime() {
        return loginTime;
    }

    public boolean addTimestamp() {
        loginTime.add(LocalDateTime.now());
        if (loginTime.size()==3) {
            // check whether these 3 timestamps are within 10 minutes;
            long firstTime =loginTime.get(0).atZone(zoneId).toEpochSecond();
            long lastTime =loginTime.get(2).atZone(zoneId).toEpochSecond();
            if (lastTime - firstTime <= 10*60) {
                return false;
            } else {
                // if 3 trial is not within 10 min
                // remove the first entry
                loginTime.remove(0);
            }
        }
        return true;
    }

}
