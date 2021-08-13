package com.project.jk.store.lesson;

import java.util.List;

public interface LessonMapper {

	public int regLesson(Lesson l);
	public List<Lesson> getAllLesson();
	public Lesson getLesson(Lesson l);
	public int lessonDelete(Lesson l);
	public int lessonUpdate(Lesson l);
	
}
