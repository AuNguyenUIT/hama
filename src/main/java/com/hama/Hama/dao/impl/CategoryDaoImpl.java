package com.hama.Hama.dao;

import com.hama.Hama.entities.CategoryEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class CategoryDaoImpl implements CategoryDao {
    @Autowired
    SessionFactory sessionFactory;

    public List<CategoryEntity> getCategories() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<CategoryEntity> cq = cb.createQuery(CategoryEntity.class);
        Root<CategoryEntity> root = cq.from(CategoryEntity.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    public int saveCategory(CategoryEntity CategoryEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(CategoryEntity);
        return CategoryEntity.getId();
    }

    public void deleteCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        CategoryEntity book = session.byId(CategoryEntity.class).load(id);
        session.delete(book);
    }

    public CategoryEntity getCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        CategoryEntity Category = session.get(CategoryEntity.class, id);
        return Category;
    }
}
