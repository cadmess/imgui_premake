#pragma once
#include <functional>
#include <memory>
#include <vector>
#include <GLFW/glfw3.h>
#include <vulkan/vulkan_core.h>

#include "Component.h"

class Application
{
public:
	template<typename T>
	void PushComponent()
	{
		static_assert(std::is_base_of_v<Component, T>, "Pushed type is not a Component!");
		m_ComponentStack.emplace_back(std::make_shared<T>())->OnAttach();
	}

	void PushComponent(const std::shared_ptr<Component>& component)
	{
		m_ComponentStack.emplace_back(component); component->OnAttach();
	}

	int Init();
	void Run();
	void Close();
	static VkInstance GetInstance();
	static VkPhysicalDevice GetPhysicalDevice();
	static VkDevice GetDevice();
	static VkCommandBuffer GetCommandBuffer();
	static void FlushCommandBuffer(VkCommandBuffer commandBuffer);


	std::vector<std::shared_ptr<Component>> m_ComponentStack;
	GLFWwindow* m_windowHandle;
	bool m_running = true;
	std::function<void()> m_menuBarCallback;
};
