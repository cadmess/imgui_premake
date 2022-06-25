#pragma once

#include "Application.h"

class ApplicationOpengl : public Application
{
public:
	int Init(int width, int height, char* description) override;
	int Run() override;
	void Close() override;
};
