package com.kpystdu.qqframe;

import com.kpystdu.qqserver.service.QQServer;

/**
 * @author KuangPanYu
 * @version 1.0
 * 该类创建QQServer ,启动后台的服务
 */
public class QQFrame {
    public static void main(String[] args)  {
        new QQServer();
    }
}
