package ua.com.bestZoo.service;

import java.util.List;

import ua.com.bestZoo.entity.Commodity;

public interface CommodityService {

	void save(Commodity commodity);

	List<Commodity> findAll();

	Commodity findOneUser(int id);

	void delete(int id);


	Commodity findByName(String name);
}
