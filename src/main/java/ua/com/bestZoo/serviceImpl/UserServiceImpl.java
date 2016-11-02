package ua.com.bestZoo.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.com.bestZoo.entity.Role;
import ua.com.bestZoo.entity.User;
import ua.com.bestZoo.entity.UserRole;
import ua.com.bestZoo.repository.UserRepository;
import ua.com.bestZoo.service.UserService;

@Service("userDetailsService")
public class UserServiceImpl  implements UserService, UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public void save(User user){
		user.setRole(Role.ROLE_USER);
		user.setPassword(encoder.encode(user.getPassword()));
		userRepository.save(user);
	}

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOneUser(int id) {
		return userRepository.findOne(id);
	}

	public void delete(int id) {
		userRepository.delete(id);
		
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userRepository.findByUsername(username);
	}

	@Modifying
	@Transactional
	@Override
	public User fetchUser(int id) {
		return userRepository.fetchUser(id);
	}

	public List<User> findAllHunters() {
		return findAll().stream().filter(User::isHunter).collect(Collectors.toList());
	}

	public List<User> findAllFeeders() {
		return findAll().stream().filter(User::isFeeder).collect(Collectors.toList());
	}

	public List<User> findAllMeetUsers() {
		return findAll().stream().filter(User::isMeetinger).collect(Collectors.toList());
	}

	public List<User> findAllSuicides() {
		return findAll().stream().filter(User::isSuicide).collect(Collectors.toList());
	}

	public List<User> findPopular(final int quantityActions) {
		return findAll().stream().filter(u -> u.getQuantityActions() >= quantityActions).collect(Collectors.toList());
	}
}
