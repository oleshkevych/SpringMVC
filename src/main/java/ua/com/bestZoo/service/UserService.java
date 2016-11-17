package ua.com.bestZoo.service;

import java.util.List;

import ua.com.bestZoo.entity.User;

public interface UserService {

	void save(User user);
	void saveFull(User user);
	List<User> findAll();
	User findOneUser(int id);
	void delete(int id);
	User fetchUser(int id);
	List<User> findAllHunters();
	List<User> findAllFeeders();
	List<User> findAllMeetUsers();
	List<User> findAllSuicides();
	List<User> findPopular(int quantityActions);
}
