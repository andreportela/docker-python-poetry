# Copyright (c) 2022 Joseph Hale
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

build:
	docker build --platform linux/amd64 \
		--tag andreportela/python-poetry:latest \
		--build-arg BUILDKIT_INLINE_CACHE=1 \
		--cache-from andreportela/python-poetry:latest \
		.

build-version:
	docker build --platform linux/amd64 \
		--tag andreportela/python-poetry:$(POETRY_VERSION)-py$(PYTHON_IMAGE_TAG) \
		--build-arg POETRY_VERSION=$(POETRY_VERSION) \
		--build-arg PYTHON_IMAGE_TAG=$(PYTHON_IMAGE_TAG) \
		--build-arg JAVA_HOME_21_X64=$(JAVA_HOME_21_X64)\
		--build-arg JAVA_HOME_8_X64=$(JAVA_HOME_8_X64)\
		--build-arg BUILDKIT_INLINE_CACHE=1 \
		--cache-from andreportela/python-poetry:$(POETRY_VERSION)-py$(PYTHON_IMAGE_TAG) \
		.
