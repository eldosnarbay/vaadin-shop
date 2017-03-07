
package crud.backend;

import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Empty JpaRepository is enough for a simple crud.
 */
public interface CategoryRepository extends JpaRepository<Category, Long> {
    
    /* A version to fetch List instead of Page to avoid extra count query. */
    List<Category> findAllBy(Pageable pageable);
    
    List<Category> findByNameLikeIgnoreCase(String nameFilter);
    
    // For lazy loading and filtering
    List<Category> findByNameLikeIgnoreCase(String nameFilter, Pageable pageable);
    
    long countByNameLike(String nameFilter);

}