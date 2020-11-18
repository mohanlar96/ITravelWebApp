package itravel.model;

public class PostReaction {
    private Avator avator;

    public PostReaction(Avator avator) {
        this.avator = avator;
    }

    public Avator getAvator() {
        return avator;
    }

    public void setAvator(Avator avator) {
        this.avator = avator;
    }

    @Override
    public String toString() {
        return "PostReaction{" +
                "avator=" + avator +
                '}';
    }
}
