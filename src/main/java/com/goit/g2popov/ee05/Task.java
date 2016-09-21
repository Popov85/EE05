package com.goit.g2popov.ee05;

/**
 * Created by Andrey on 21.09.2016.
 */
public class Task {
        private String taskName;
        private String category;
        private boolean isCompleted;

        public Task(String taskName, String category) {
                this.taskName = taskName;
                this.category = category;
                this.isCompleted = false;
        }

        public String getTaskName() {
                return taskName;
        }

        public String getCategory() {
                return category;
        }

        public boolean isCompleted() {
                return isCompleted;
        }

        @Override
        public String toString() {
                return "Task{" +
                        "taskName='" + taskName + '\'' +
                        ", category='" + category + '\'' +
                        ", isCompleted=" + isCompleted +
                        '}';
        }
}
