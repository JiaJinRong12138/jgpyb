package com.jgpyb.filter;

import com.jgpyb.utils.LogUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "ViewFilter", urlPatterns = "/*")
public class ViewFilter implements Filter {

    // 登录限制的URI
    private final String[] uris = {
            "/jgpyb/userinfo.view",
            "/jgpyb/sendaction.view",
            "/jgpyb/delete",
            "/jgpyb/dianz"
    };

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession();
        for (String uri:uris
             ) {
            if(uri.equals(request.getRequestURI())){
                if(session.getAttribute("userinfo") == null){
                    LogUtils.LOGINFO("The Uri Can't In");
                    response.sendRedirect("/jgpyb/login.view");
                    return;
                }
            }
        }

        if("/jgpyb/logout".equals(request.getRequestURI())){
            session.removeAttribute("userinfo");
            response.sendRedirect("/jgpyb/index.html");
            return;
        }
        LogUtils.LOGINFO(request.getRequestURI());
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
