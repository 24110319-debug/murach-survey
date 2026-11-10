package murach.data;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import murach.business.User;

/** Demo storage only: resets when the application restarts. */
public final class UserDB {
    private static final List<User> USERS = new CopyOnWriteArrayList<>();
    private UserDB() {}
    public static int insert(User user) {
        USERS.add(user);
        return 1;
    }
}
