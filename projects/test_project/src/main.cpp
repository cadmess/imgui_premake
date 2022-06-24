#include "Application.h"
#include "imgui.h"

class TestComponent final : public Component
{
public:
    void OnRender() override
    {
        ImGui::ShowDemoWindow();
    }
};

int main(int, char**)
{
    Application* app = new Application();
    app->Init();

    app->PushComponent<TestComponent>();


    app->Run();
}