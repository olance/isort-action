FROM python:3

LABEL "com.github.actions.name"="Sort your Python imports with isort"
LABEL "com.github.actions.description"="Format Python code using isort"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/olance/isort-action"
LABEL "homepage"="https://github.com/olance/isort-action"
LABEL "maintainer"="Olivier Lance <olivier@techtrails.io>"

RUN pip install isort

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
