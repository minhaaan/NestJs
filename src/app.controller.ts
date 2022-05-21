import { Controller, Get, Post, Put, Delete } from '@nestjs/common';
import { AppService } from './app.service';

// localhost:4000/hello
@Controller('todos')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): any {
    return this.appService.getHello;
  }

  @Post()
  postHello(): any {
    return this.appService.postHello;
  }

  @Put()
  putHello(): any {
    return this.appService.putHello;
  }

  @Delete()
  deleteHello(): any {
    return this.appService.deleteHello;
  }
}
