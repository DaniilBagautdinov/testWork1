package ru.kpfu.itis.bagautdinov;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "WeatherServlet", urlPatterns = "/weather")
public class WeatherServlet extends HttpServlet {

    private final WeatherService weatherService = new WeatherService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String city = req.getParameter("city");
        Map<String, String> result = weatherService.get(city);
        String string = new ObjectMapper().writeValueAsString(result);
        resp.setCharacterEncoding("UTF-8");
        if(result != null) {
            resp.getWriter().write(string);
        } else {
            resp.getWriter().write("Error found");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getServletContext().getRequestDispatcher("/weather.ftl").forward(req, resp);
    }
}
