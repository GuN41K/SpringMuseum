package museum.controller;

import museum.dto.post.PostDto;
import museum.dto.post.PostSaveDto;
import museum.exception.EntityConstraintException;
import museum.exception.PostExistException;
import museum.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * Controller class for 'post' page.
 *
 * @author Rostyslav Khasanov
 * @version 1.0
 */
@Controller
@RequestMapping("/post")
public class PostController {

  @Autowired private PostService postService;

  /**
   * Handles request to post post into db.
   *
   * @param postSaveDto post request dto from jsp.
   */
  @PostMapping
  public String save(@Valid @ModelAttribute PostSaveDto postSaveDto, ModelMap modelMap) {
    try {
      postService.save(postSaveDto);
      return "redirect:/worker";
    } catch (PostExistException e) {
      modelMap.addAttribute("message", e.getMessage());
      return "errorMessage";
    }
  }

  /** Handles request to redirect on addPost page. */
  @RequestMapping("/add")
  public String addPostPage() {
    return "worker/addPost";
  }

  /**
   * Handles request to delete post by id from db.
   *
   * @param id post id.
   */
  @GetMapping(value = "/delete", params = "id")
  public String deleteWorker(@RequestParam Long id, ModelMap modelMap) {
    try {
      postService.delete(id);
      return "redirect:/worker";
    } catch (EntityConstraintException e) {
      modelMap.addAttribute(
          "message", e.getMessage());
      return "errorMessage";
    }
  }
}
