# 使用官方 Mono 基礎映像
FROM mono:latest

# 設定工作目錄
WORKDIR /app

# 安裝所需套件
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y git unzip wget && \
    rm -rf /var/lib/apt/lists/*

# 克隆 DotNetToJScript 倉庫
COPY DotNetToJScript DotNetToJScript

# 下載並解壓 NDesk.Options
RUN mkdir DotNetToJScript/packages && \
    cd DotNetToJScript/packages && \
    wget http://www.ndesk.org/archive/ndesk-options/ndesk-options-0.2.1.bin.zip && \
    unzip ndesk-options-0.2.1.bin.zip && \
    mkdir -p NDesk.Options.0.2.1/lib && \
    cp ndesk-options-0.2.1.bin/lib/ndesk-options/NDesk.Options.dll NDesk.Options.0.2.1/lib

# 修改資源路徑大小寫問題
RUN sed -i -e 's|resources|Resources|' ./DotNetToJScript/DotNetToJScript/Properties/Resources.resx

# 編譯 DotNetToJScript
RUN cd DotNetToJScript && xbuild /p:Configuration=Release



# 將執行命令放入 script 中，方便重用
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# 啟動時執行 script
CMD ["/app/run.sh"]

