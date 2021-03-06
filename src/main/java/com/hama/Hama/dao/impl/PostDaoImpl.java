package com.hama.Hama.dao.impl;

import com.hama.Hama.dao.PostDao;
import com.hama.Hama.entities.OrderEntity;
import com.hama.Hama.entities.PostEntity;
import com.hama.Hama.entities.ProductEntity;
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
public class PostDaoImpl implements PostDao {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<PostEntity> getPosts() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<PostEntity> cq = cb.createQuery(PostEntity.class);
        Root<PostEntity> root = cq.from(PostEntity.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public int savePost(PostEntity PostEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(PostEntity);
        return PostEntity.getId();
    }

    @Override
    public Boolean deletePost(int id) {
        Session session = sessionFactory.getCurrentSession();
        PostEntity book = session.byId(PostEntity.class).load(id);
        try {
            session.remove(book);
            session.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public PostEntity getPost(int id) {
        Session session = sessionFactory.getCurrentSession();

        PostEntity post = null;
        try {
            post = session.get(PostEntity.class, id);
        }catch (Exception  e){
            System.out.println(e.getMessage());
        }
        return post;
    }

    @Override
    public List<PostEntity> getPostsByQuery(String queryString) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(queryString);
        return query.getResultList();
    }
}
