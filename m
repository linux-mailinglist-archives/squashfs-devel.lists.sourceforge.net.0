Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF85274CE
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001IV-Oo; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1npZmj-0000HN-Rj
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 18:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PDoRf50/2prdMwiGzu9XwiSUsoeLHlgrKt3Aw5ZPQ7k=; b=Vin8hu1XVga8xrhls16fXq6ijk
 vyna6vxN+vhSJYZnWj/MN26k1/c5Dasog0oFyBcfvXGN9C9kI4JJsMHHzlxK4cAjpM9mCza40ZHcU
 FkcS0tdYF2h991HeRCQ/tDNk9+pexN2fQX1lauFhM+tMZKq3BH/EZZVq6BC0UvY0ar00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PDoRf50/2prdMwiGzu9XwiSUsoeLHlgrKt3Aw5ZPQ7k=; b=HgDR+68uEQQa6wu2wqjELP2zSn
 x4HLqCTp9bnTBSqmP+9wX48xggHEJ5Dszmb7Uyrk/U25vYKbHphjC8B0wE+TpCD+UAK0TOsp2bBgO
 kp0wNzXda03+qZH6Nt/L+gadB0a5bf5Cmr5UULnyxltZpaAbU+8sxFlhFov29aY22cs8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npZmf-00B9Se-Ez
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 18:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PDoRf50/2prdMwiGzu9XwiSUsoeLHlgrKt3Aw5ZPQ7k=; b=cfRcQokCSVzkWsZBWMU83zH0Xu
 QA3j9BbAzGUp/vJ6qO9qTaoN1b7lBwVzT9WgjFQftAXkH0MyCRysSbmP/hQLW6Dr3RIJEUgObkRfv
 1t+Z4WWSIhe+cYbIp7Q0TXE+rAgdvLCKqNI4ix2oBw4VV/iW/h5ug1P++M2WWYIX0zdILfUPom6Dl
 yyb2nNRO1XGVsucWQMOmkw4++IrZZZVmf4QTvudZ0doxGklQgrkSwWG3TZDCG0RwvAE0rCZCDy4fr
 69QYjJU9ez0IKzl3NarDe7ak7pe5eW+iVnMd3WewGAd5d0LsFJDiG54rzLxvRthpc8KZt7tpM+m8F
 dcEPmvLw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1npZm9-007Yds-UH; Fri, 13 May 2022 18:12:29 +0000
Date: Fri, 13 May 2022 19:12:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Message-ID: <Yn6fjVg6mzVJBNt0@casper.infradead.org>
References: <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <CAEVVKH-VyKsFwOrY2kc7JPWtOB=usXtdia6tgcBwJCkcWPFx7g@mail.gmail.com>
 <CAJMQK-jx1_Zibxa48RSSKsFdt5kfoS22Csm5a_9sqTqGXOuCuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJMQK-jx1_Zibxa48RSSKsFdt5kfoS22Csm5a_9sqTqGXOuCuA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 14, 2022 at 12:43:47AM +0800, Hsin-Yi Wang wrote:
 > > One stupid question, see below code from your patch: > > > > + } > >
 + > > + kfree(actor); > > + return; > > + > > +skip_pages: > > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1npZmf-00B9Se-Ez
X-Mailman-Approved-At: Sun, 15 May 2022 01:16:57 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hou Tao <houtao1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Sat, May 14, 2022 at 12:43:47AM +0800, Hsin-Yi Wang wrote:
> > One stupid question, see below code from your patch:
> >
> >  +       }
> >  +
> >  +       kfree(actor);
> >  +       return;
> >  +
> >  +skip_pages:
> >
> > when release page pointers array after pages cached? I don't see
> > any chance to do that.
> >
> actor is not a page pointer. This is allocated from
> squashfs_page_actor_init() and should be freed after use. Or do you
> mean skip_pages? There are some situations where we can't decompress
> the whole block, so we will skip those pages.

I think the concern is that you don't seem to kfree(pages) on this
exit path.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
