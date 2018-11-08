package com.animal.aniwhere.web.board.animal.rna;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.animal.MovieBoardDTO;
import com.animal.aniwhere.service.animal.PhotoBoardDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.PhotoBoardServiceImpl;

@Controller
public class RnAPhotoController {
	
}//////////////////// PhotoController class