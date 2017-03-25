
package eshop.repository;

import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import eshop.entity.Users;

/**
 * Empty JpaRepository is enough for a simple crud.
 */
public interface UserRepository extends JpaRepository<Users, Long> {
    
    /* A version to fetch List instead of Page to avoid extra count query. */
    List<Users> findAllBy(Pageable pageable);
    
    List<Users> findByNameLikeIgnoreCase(String nameFilter);
    
    // For lazy loading and filtering
    List<Users> findByNameLikeIgnoreCase(String nameFilter, Pageable pageable);
    
    long countByNameLike(String nameFilter);

}
