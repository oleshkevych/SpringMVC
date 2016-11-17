package ua.com.bestZoo.entity;

/**
 * Created by vov4ik on 11/2/2016.
 */
public enum Weapon {


    USERSWEAPON("YOU WEAPON"),
    KNIF("You can slaughter free or bound animal"),
    PISTOL ("Shoot the animal from close distance. ATTENTION!!!! You will have only 14 ammo! Don't miss!"),
    M16("This is the great chance to take revenge for all, even for the stolen toy in childhood. You will have enough ammo for this))"),
    BARRETT("This lovely semi-automatic sniper rifle gives the good chance for bloody murder from close distance with small explosion. " +
            "Or you can try your self from the distances till 1 kilometer."),
    BAZOOKA("A short-range tubular rocket launcher used against tanks. Every thing else you cam image by your self)))");

    private String displayDescription;

    private Weapon(String displayDescription) {
        this.displayDescription = displayDescription;
    }

    public String getDisplayDescription() {
        return this.displayDescription;
    }
}
