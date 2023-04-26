// import axios from "axios";

export const fetchPosts = async (currentPage: number) => {
  const dataPosts = await fetch(
    `https://jsonplaceholder.typicode.com/posts?_limit=4&_page=${currentPage}`
  ).then((res) => res.json());

  return dataPosts;
};

export const fetchComments = async (postId: number) => {
  const comments = await fetch(
    `https://jsonplaceholder.typicode.com/comments?postId=${postId}`
  ).then((res) => res.json());

  return comments;
};

export const deletePost = async (postId: number) => {
  await fetch(`https://jsonplaceholder.typicode.com/posts/${postId}`, {
    method: "DELETE",
  });
};

export const editPost = async (postId: number) => {
  await fetch(`https://jsonplaceholder.typicode.com/posts/${postId}`, {
    method: "PUT",
    body: JSON.stringify({ title: "title" }),
  });
};
