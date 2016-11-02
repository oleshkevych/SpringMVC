package ua.com.bestZoo.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
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

	@Enumerated
	private Role role;

	@Enumerated
	private UserRole userRole;

	private String pathImage;

	@OneToMany(fetch=FetchType.EAGER, mappedBy="user")
	private List<UserOrder> userOrders;

	@ManyToOne(fetch=FetchType.LAZY)
	private Zoo zoo;

	public User() {
		super();
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

	public User(String username, String phoneNumber, String password, String email) {
		super();
		this.username = username;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.email = email;
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


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + ((phoneNumber == null) ? 0 : phoneNumber.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		if (phoneNumber == null) {
			if (other.phoneNumber != null)
				return false;
		} else if (!phoneNumber.equals(other.phoneNumber))
			return false;
		if (role != other.role)
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}





}
