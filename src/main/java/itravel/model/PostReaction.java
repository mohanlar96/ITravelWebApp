package itravel.model;

public class PostReaction {
    private User user;

    public PostReaction(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "PostReaction{" +
                "user=" + user +
                '}';
    }
}
