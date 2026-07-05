FROM python:3.12-slim

WORKDIR /app

# 复制项目文件
COPY pyproject.toml README.md ./
COPY src/ ./src/

# 使用阿里云 PyPI 镜像源加速安装
RUN pip install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ \
    "mcp[cli]>=1.0.0" httpx pydantic && \
    pip install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ \
    -e .

ENTRYPOINT ["kingdee-mcp"]
