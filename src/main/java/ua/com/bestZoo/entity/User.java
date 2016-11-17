package ua.com.bestZoo.entity;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ua.com.bestZoo.service.ZooService;

@Entity
@org.hibernate.annotations.Entity(
		dynamicUpdate = true
)
public class User implements UserDetails {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String username;
	private	String phoneNumber;
	private String password;
    private	String email;
    private int bonuses;
    private int quantityActions;
    private boolean isSuicide;
    private boolean isFeeder;
    private boolean isHunter;
    private boolean isMeetinger;
	private int quantityFeeds;
	private boolean deletedUser;

	@Enumerated
	private Role role;

	@Enumerated
	private UserRole userRole;

	private String pathImage;

	@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
	private List<UserOrder> userOrders;

	@ManyToOne
	private Zoo zoo;

    public User(String username, String phoneNumber, String password, String email) {
        super();
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.email = email;
        bonuses = 0;
        quantityActions = 0;
        isSuicide = false;
        isFeeder = false;
        isHunter = false;
        isMeetinger = false;
        quantityFeeds = 0;
        userRole = UserRole.NOTENOUGHSMART;
        pathImage = "image"+ File.separator+"0default.jpg";
        role = Role.ROLE_USER;
		userOrders = new ArrayList<>();
		deletedUser = false;

    }

	public User() {
		super();
	}

	public boolean isDeletedUser() {
		return deletedUser;
	}

	public void setDeletedUser(boolean deletedUser) {
		this.deletedUser = deletedUser;
	}

	public Zoo getZoo() {
		return zoo;
	}

	public void setZoo(Zoo zoo) {
		this.zoo = zoo;
	}

	public List<UserOrder> getUserOrders() {
		return userOrders;
	}

	public void setUserOrders(List<UserOrder> userOrders) {
		this.userOrders = userOrders;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public int getQuantityFeeds() {
		return quantityFeeds;
	}

	public void setQuantityFeeds(int quantityFeeds) {
		this.quantityFeeds = quantityFeeds;
	}

	public int getQuantityActions() {
		return quantityActions;
	}

	public void setQuantityActions(int quantityActions) {
		this.quantityActions = quantityActions;
	}

	public boolean isSuicide() {
		return isSuicide;
	}

	public void setSuicide(boolean suicide) {
		isSuicide = suicide;
	}

	public boolean isFeeder() {
		return isFeeder;
	}

	public void setFeeder(boolean feeder) {
		isFeeder = feeder;
	}

	public boolean isHunter() {
		return isHunter;
	}

	public void setHunter(boolean hunter) {
		isHunter = hunter;
	}

	public boolean isMeetinger() {
		return isMeetinger;
	}

	public void setMeetinger(boolean meetinger) {
		isMeetinger = meetinger;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBonuses() {
		return bonuses;
	}

	public void setBonuses(int bonuses) {
		this.bonuses = bonuses;
	}


	public String getPathImage() {
		return pathImage;
	}


	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}

	public String userName(){
		return username;
	}

	public String getUserName() {
		return String.valueOf(id);
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(role.name()));
		return authorities;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return String.valueOf(id);
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
