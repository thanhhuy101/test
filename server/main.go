package main

import (
	"context"
	"log"
	"net/http"

	firebase "firebase.google.com/go"
	"github.com/gin-gonic/gin"
	"google.golang.org/api/iterator"
	"google.golang.org/api/option"
)

type Course struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Image       string `json:"image"`
	Logo        string `json:"logo"`
}

func main() {
	// Bước 1: Khởi tạo ngữ cảnh
	ctx := context.Background()

	// Bước 2: Cài đặt tùy chọn cho Firebase Admin SDK
	opt := option.WithCredentialsFile("key/accountkey.json")

	// Bước 3: Khởi tạo ứng dụng Firebase
	app, err := firebase.NewApp(ctx, nil, opt)
	if err != nil {
		log.Fatalf("error initializing app: %v\n", err)
	}

	// Bước 4: Khởi tạo client Firestore
	client, err := app.Firestore(ctx)
	if err != nil {
		log.Fatalf("error initializing Firestore client: %v\n", err)
	}
	defer client.Close()

	// Khởi tạo router Gin
	router := gin.Default()

	// Định nghĩa tuyến đường để lấy danh sách khóa học
	router.GET("/courses", func(c *gin.Context) {
		iter := client.Collection("courses").Documents(ctx)

		var courses []Course
		for {
			doc, err := iter.Next()
			if err == iterator.Done {
				break
			}
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Error iterating through documents"})
				return
			}

			var course Course
			err = doc.DataTo(&course)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Error decoding document"})
				return
			}

			courses = append(courses, course)
		}

		c.JSON(http.StatusOK, courses)
	})

	// Khởi động máy chủ HTTP để lắng nghe các yêu cầu
	go func() {
		if err := router.Run(":8080"); err != nil {
			log.Fatalf("Failed to start server: %v", err)
		}
	}()

	log.Println("Server is running on :8080")
	select {}
}
