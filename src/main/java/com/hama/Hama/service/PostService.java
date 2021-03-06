package com.hama.Hama.service;

import com.hama.Hama.entities.PostEntity;
import com.hama.Hama.entities.ProductEntity;

import java.util.List;

public interface PostService {

    Integer savePost(PostEntity post);

    Boolean deletePost(Integer id);

    List<PostEntity> getPosts();

    PostEntity getPost(Integer id);

    List<PostEntity> getPostsByQuery(String queryString);

}
