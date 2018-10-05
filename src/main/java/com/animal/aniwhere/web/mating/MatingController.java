package com.animal.aniwhere.web.mating;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatingController {
   
   @RequestMapping("/mating/main.aw")
   public String mating_main() throws Exception {
      return "mating/matingMain.tiles";
   }////////// mating_main
   
   @RequestMapping("/mating/matingProfile.aw")
   public String mating_profile() throws Exception {
      return "mating/matingProfile.tiles";
   }
   
   @RequestMapping("/matingLogin.aw")
   public String mating_login() throws Exception {
      return "mating/matingLogin.tiles";
   }
   
   @RequestMapping("/matingMatch.aw")
   public String mating_match() throws Exception {
      return "mating/matingMatch.tiles";
   }
}
