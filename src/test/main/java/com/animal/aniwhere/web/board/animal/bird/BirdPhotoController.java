package com.animal.aniwhere.web.board.animal.bird;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BirdPhotoController {
   //등록 폼으로 이동]
   @RequestMapping("/board/animal/bird/photo/write.aw")
   public String write() throws Exception{
      
      return "board/animal/bird/photo/photo_write.tiles";
   }///////////////////////////
   
   
}//////////////////// PhotoController class