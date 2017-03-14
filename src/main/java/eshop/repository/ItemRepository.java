package eshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import eshop.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

}