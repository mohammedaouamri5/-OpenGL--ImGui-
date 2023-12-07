
#include "core/Layout.hpp"
#include "core/Win.hpp"
#include "imgui.h"
#include <iostream>
#include <memory>

#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>

// Simple helper function to load an image into an OpenGL texture with common settings

static int WOW = 1;
static GLuint textureID;
void Test()
{
}

class ExampleLayer : public CORE::Layout
{
public:
    virtual void INIT() override
    {
        this->textureID = LoadImageTexture("img.jpg" , width, height );
    }
    virtual void RUN() override
    {
        ImGui::Begin("OpenGL Texture Text");
 
         

        ImGui::Text("pointer = %p", (void *)(intptr_t)textureID);
        ImGui::Image((void *)(intptr_t)(this->textureID), ImVec2(width, height));

        ImGui::End();
        ImGui::ShowDemoWindow();
    }

private:
    GLuint textureID;
    int width, height ; 
    GLuint LoadImageTexture(const char *imagePath, int &width, int &height)
    {
        stbi_set_flip_vertically_on_load(true);
        unsigned char *image = stbi_load(imagePath, &width, &height, nullptr, 4);

        if (!image)
        {
            // Handle error loading image
            return 0;
        }

        GLuint textureID;
        glGenTextures(1, &textureID);
        glBindTexture(GL_TEXTURE_2D, textureID);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, image);

        stbi_image_free(image);

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        return textureID;
    }
};

// Main code
int main(int, char **)
{

    std::unique_ptr<CORE::Win> win(new CORE::Win);

    win->ADD(new (ExampleLayer));

    win->INIT();
    win->RUN();
    win->CLOSE();
    return 0;
}
