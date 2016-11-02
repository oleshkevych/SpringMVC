package ua.com.bestZoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetails;

import ua.com.bestZoo.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	
	public UserDetails findByUsername(String username);
	
	
	@Query(value="select distinct u from User u left join fetch u.userOrders o where u.id =:id")
	public User fetchUser(@Param("id") int id);
}
