package com.project.jk.store.lesson;

import java.util.ArrayList;

import com.project.jk.store.Store;


public interface LessonMapper {

	public int regLesson(Lesson l);
	public ArrayList<Lesson> getAllLesson();
	public Lesson getLesson(Lesson l);
	public int lessonDelete(Lesson l);
	public int lessonUpdate(Lesson l);
	public ArrayList<Lesson> getLessonLabel(Lesson l);
	public ArrayList<Lesson> getAllLesson2(Store s);

}
