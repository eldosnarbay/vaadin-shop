package eshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import eshop.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

	@Query("SELECT g FROM Item g ORDER BY name")
	List<Item> findAllSorted();
}