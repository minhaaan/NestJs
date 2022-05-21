import { Injectable, Res } from '@nestjs/common';
import { type } from 'os';

@Injectable()
export class AppService {
  getHello(@Res() res): any {
    return res.status(200).send({ name: 'minan', age: 24, type: 'get' });
  }

  postHello(@Res() res): any {
    return res.status(200).send({ name: 'minan', age: 24, type: 'post' });
  }

  putHello(@Res() res): any {
    return res.status(200).send({ name: 'minan', age: 24, type: 'put' });
  }

  deleteHello(@Res() res): any {
    return res.status(200).send({ name: 'minan', age: 24, type: 'delete' });
  }
}
