package com.hama.Hama.repository;

import com.hama.Hama.entities.ArticleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("articleRepository")
public interface ArticleRepository extends JpaRepository<ArticleEntity, Integer> {

}