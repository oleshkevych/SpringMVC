package ua.com.bestZoo.entity;

/**
 * Created by vov4ik on 11/2/2016.
 */
public enum OrderType {

    MEETING("Meet the animal, walk, speak. You can try to feed, if you want. Also you can safely play with the selected animal!!! "),
    SUICIDE("Meet the animal, walk, speak. You can try to feed, if you want. Play with the selected animal. Be careful - you can to be killed or to be eaten during this process..."),
    FEED("Meet the animals and give some annoying person. ATTENTION!!! You can get only ONE person during one meeting! If you are the misanthrope, our Zoo gives the good bonuses " +
            "for the large company of annoying people))))"),
    HUNTING("Meet the animal, walk, speak. You can try to feed, if you want. Also you can safely play with the selected animal. After all of this activities you will able " +
            "to kill this lovely animal. You can bring the weapon or choose something ours))");

    private String displayDescription;

    private OrderType(String displayDescription) {
        this.displayDescription = displayDescription;
    }

    public String getDisplayDescription() {
        return this.displayDescription;
    }

}
