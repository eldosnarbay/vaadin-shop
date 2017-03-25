package eshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import eshop.entity.Categories;

public interface CategoryRepository extends JpaRepository<Categories, Integer> {

}