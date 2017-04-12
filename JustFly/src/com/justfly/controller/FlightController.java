package com.justfly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.justfly.entities.Airports;

@Controller
public class FlightController {

	@RequestMapping("/bookflight")
	public ModelAndView bookflight() {

		return new ModelAndView("bookFlight", "command", new Airports());
	}
	@RequestMapping(value = "/results", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("SpringWeb")Airports airports, 
			   ModelMap model) {
			      model.addAttribute("airport1",airports.getAirport1());
			      model.addAttribute("airport2",airports.getAirport2());
			      model.addAttribute("day", airports.getDay());
			      model.addAttribute("traveller", airports.getTraveller());
			      return "flightList";
			   }

}