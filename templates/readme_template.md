# Lesson XX - Lesson Name

| **Documentation**                       | **Build Status**                 |
|:---------------------------------------:|:--------------------------------:|
| [![][docs-stable-img]][docs-stable-url] | [![][travis-img]][travis-url]    |

[Lesson repository](#)

## Steps to copying template

- [ ] Find/Replace all "LessonX" => "Lesson{#}"
- [ ] rename `src/LessonX.jl` => `src/Lesson{#}`
- [ ] change uuid in `Project.toml` (`$ julia -e 'using UUIDs; println(UUIDs.uuid4())'`)
- [ ] change package url in `docs/build.jl`
- [ ] change urls for build/docs in README.md
- [ ] delete this header block from readme

## Learning Objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast ...
- Identify ...
- Explain ...

**Skills** - After completing this lesson, students will be able to:

-

## Description

In this lesson ...


[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://wellesley-bisc195.github.io/lesson_XX/stable
